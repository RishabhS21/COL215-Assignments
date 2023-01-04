library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity regi is
  Port (data_in: in std_logic_vector(15 downto 0);
      data_out: out std_logic_vector(15 downto 0);
                 reset ,clk,re,we: in std_logic);
end regi;

architecture Behavioral of regi is
signal latch: std_logic_vector(data_in' range):=(others =>'0');
begin
data_out<=latch;
process(clk,reset,we)
begin
if(reset='1') then
    latch<=(latch ' range=>'0');
elsif(rising_edge(clk)) then
    if(we='1') then 
    latch<=data_in;
    end if;
end if;
end process;
end Behavioral;
