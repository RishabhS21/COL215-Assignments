library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ass2_tb is
end ass2_tb;

architecture tb of ass2_tb is
    component ass2
        port(
           clk: in std_logic;
          reset: in std_logic;
          start: in std_logic;
          pause: in std_logic;
          continue: in std_logic;
          a1 : out STD_LOGIC;
           b1 : out STD_LOGIC;
           c1 : out STD_LOGIC;
           d1 : out STD_LOGIC;
           e1 : out STD_LOGIC;
           f1 : out STD_LOGIC;
           g1 : out STD_LOGIC;
           dp : out STD_LOGIC;
           vec : out STD_LOGIC_VECTOR (3 downto 0) );
    end component;
    
    
    signal clk : std_logic:='0';
    signal a1,b1,c1,d1,e1,f1,g1,dp : std_logic;
    signal reset,start,pause,continue: std_logic;
    signal count : integer := 0;
    signal vec : std_logic_vector(3 downto 0);
    
    
    begin
    process (clk) is
    begin
    if (count<1200000) then 
    count <= count+1;
    clk <= (not clk) after   10 ns;
    end if;
    end process;
    
    design2 : ass2 port map(clk=>clk, reset=>reset, start=> start, pause=> pause, continue=> continue, a1=>a1,b1=>b1,c1=>c1,d1=>d1,e1=>e1,f1=>f1,g1=>g1,dp=>dp, vec=>vec);
    
    reset <= '0' , '1' after 30 ns, '0' after 60 ns, '1' after 90 ns;
    start <= '0' , '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
    pause <='0' , '1' after 15 ns, '0' after 30 ns, '1' after 45 ns;
    continue<='0' , '1' after 50 ns, '0' after 100 ns, '1' after 150 ns;
    
    end tb;