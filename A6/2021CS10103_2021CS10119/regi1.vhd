----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2022 22:15:00
-- Design Name: 
-- Module Name: regi1 - Behavioral
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

entity regi1 is
  Port (din: in std_logic_vector(7 downto 0);
       dout: out std_logic_vector(7 downto 0);
        clk,re,we: in std_logic);
end regi1;

architecture Behavioral of regi1 is
signal latch: std_logic_vector(din' range):=(others=>'0');
begin
dout<=latch;
process(clk,re,we)
begin
if(re='1') then
    dout<=latch;
elsif(rising_edge(clk)) then
    if(we='1') then 
    latch<=din;
--    lm<=latch;
    end if;
 end if;
end process;
end Behavioral;
