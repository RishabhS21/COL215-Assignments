library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regi2 is
  Port (din: in std_logic_vector(7 downto 0);
     dout: out std_logic_vector(7 downto 0);
                        clk,re,we: in std_logic);
end regi2;

architecture Behavioral of regi2 is
signal latch: std_logic_vector(din' range):=(others =>'0');
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

