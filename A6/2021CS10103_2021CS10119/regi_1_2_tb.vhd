library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regi_1_2_tb is
--  Port ( );
end regi_1_2_tb;

architecture Behavioral of regi_1_2_tb is
component regi1
Port (din: in std_logic_vector(7 downto 0);
      dout: out std_logic_vector(7 downto 0);
                        clk,re,we: in std_logic);
end component;
signal re,we:std_logic;
signal clka:std_logic:='0';
signal lm,d_in,d_out:std_logic_vector(7 downto 0);
begin
UUT:regi1 port map(din=>d_in,dout=>d_out,clk=>clka,re=>re,we=>we,lm=>lm);
process(clka)
begin
clka<=not clka after 5 ps;
end process;
d_in<="00000100";
we<='1','0' after 16 ps;
re<='0','1' after 20 ps;
end Behavioral;
