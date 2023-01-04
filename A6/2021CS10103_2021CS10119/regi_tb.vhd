----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 10:06:10
-- Design Name: 
-- Module Name: regi_tb - Behavioral
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
entity regi_tb is
end regi_tb;
-- register testbenches
architecture Behavioral of regi_tb is
component regi
Port (data_in: in std_logic_vector(15 downto 0);
      data_out: out std_logic_vector(15 downto 0);
                 reset ,clk,re,we: in std_logic);
end component;
signal res,re,we:std_logic;
signal clka:std_logic:='0';
signal d_in,d_out:std_logic_vector(15 downto 0);
begin
UUT:regi port map(data_in=>d_in,data_out=>d_out,reset=>res ,clk=>clka,re=>re,we=>we);

process(clka)
begin
clka<=not clka after 5 ps;
end process;
d_in<="0000000000000100";
we<='1','0' after 20 ps;
res<='0';
re<='1';
end Behavioral;
