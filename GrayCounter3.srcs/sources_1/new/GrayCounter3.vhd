----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 18:38:52
-- Design Name: 
-- Module Name: GrayCounter3 - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GrayCounter3 is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end GrayCounter3;

architecture Behavioral of GrayCounter3 is

signal gray_count : std_logic_vector(2 downto 0) := "000";

begin

    process(clk_i, rst_i)
    begin
        if(rst_i = '1') then
            gray_count <= "000";
        elsif rising_edge(clk_i) then
            gray_count <= gray_count + '1';
        end if;
    end process;

led_o(2) <= gray_count(2);
led_o(1) <= gray_count(2) xor gray_count(1);
led_o(0) <= gray_count(1) xor gray_count(0);

end Behavioral;

