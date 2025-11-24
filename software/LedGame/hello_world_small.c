#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include <stdio.h>
#include <unistd.h>

int main(void)
{
  alt_u32 sw;
  int led_index = 0;

  printf("LED Game: Toggle speed based on switches \n");

  while (1)
  {
    // Lire l'état des switches (8 bits)
    sw = IORD_ALTERA_AVALON_PIO_DATA(SWITCHES_BASE) & 0xFF;

    // Compter le nombre de bits actifs (nombre de switchs ON)
    int speed_factor = __builtin_popcount(sw);  // Native GCC bit count

    // Calculer la vitesse (plus de switchs = plus rapide)
    // Base: 300ms, min: 50ms -> ajusté selon le nombre de switchs ON
    int delay_us = (speed_factor > 0) ? (500000 / (3*speed_factor)) : 500000;

    // Afficher la vitesse (optionnel)
    printf("Switches ON = %d, Speed = %d us\n", speed_factor, delay_us);

    // Allumer une LED à la fois (effet chenillard)
    IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, 1 << led_index);

    // Passer à la LED suivante, modulo 8
    led_index = (led_index + 1) % 8;

    // Pause en micro-secondes
    usleep(delay_us);
  }

  return 0;
}
