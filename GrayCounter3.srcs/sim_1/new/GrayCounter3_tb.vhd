----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 18:39:34
-- Design Name: 
-- Module Name: GrayCounter3_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GrayCounter3_tb is
--  Port ( );
end GrayCounter3_tb;

architecture Behavioral of GrayCounter3_tb is
    component GrayCounter3
        PORT(clk_i : in STD_LOGIC;
        rst_i : in STD_LOGIC;
        led_o : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    --inputs
    signal clk_i : std_logic;
    signal rst_i : std_logic;
    
    --output
    signal led_o : std_logic_vector(2 downto 0);
    
    constant CLOCK_period : time := 20 ns;
    constant delay : time := 10 ns;
    
begin
     uut: GrayCounter3 PORT MAP(
        clk_i => clk_i,
        rst_i => rst_i,
        led_o => led_o
     );
    --clock process definition
    CLOCK_process : process
    begin
        clk_i <= '1';
        wait for CLOCK_period/2;
        clk_i <= '0';
        wait for CLOCK_period/2;
    end process;
    
    -- stimulus process
    stim_proc: process
    begin       
        rst_i <= '1';
        wait for delay;
        rst_i <= '0';
        wait for 50 ns;
        rst_i <= '1';
        wait for delay;
        rst_i <= '0';    
        wait;
    end process;
end Behavioral;