library ieee;
use ieee.std_logic_1164.all;

entity tpsopc is
    port (
        CONNECTED_TO_clk_clk                      : in  std_logic;                        -- Clock input
        CONNECTED_TO_reset_reset_n                : in  std_logic;                        -- Active-low reset
        CONNECTED_TO_switches_external_connection_export : in  std_logic_vector(7 downto 0); -- 8 switches input
        CONNECTED_TO_leds_external_connection_export     : out std_logic_vector(7 downto 0)  -- 8 LEDs output
    );
end tpsopc;

architecture arch of tpsopc is

    -- Declare the SoPC component (from Qsys HDL example)
    component SoPC is
        port (
            clk_clk                             : in  std_logic := 'X';             
            reset_reset_n                       : in  std_logic := 'X';             
            switches_external_connection_export : in  std_logic_vector(7 downto 0) := (others => 'X'); 
            leds_external_connection_export     : out std_logic_vector(7 downto 0)
        );
    end component SoPC;

begin

    -- Instantiate the Qsys SoPC system
    u0 : component SoPC
        port map (
            clk_clk                             => CONNECTED_TO_clk_clk,                      -- Clock
            reset_reset_n                       => CONNECTED_TO_reset_reset_n,                -- Reset
            switches_external_connection_export => CONNECTED_TO_switches_external_connection_export, -- Switches input
            leds_external_connection_export     => CONNECTED_TO_leds_external_connection_export      -- LEDs output
        );

end arch;
