

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ass2 is
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
end ass2;

architecture Behavioral of ass2 is

signal cw0, cw1, cw2, cw3 : STD_LOGIC_VECTOR (3 downto 0);

component stopwatch is
port(
   clk: in std_logic;
   reset: in std_logic;
   start: in std_logic;
   pause: in std_logic;
   continue: in std_logic;
   cw0, cw1, cw2, cw3 : out STD_LOGIC_VECTOR (3 downto 0));

end component;

component assignment1
        port (
             clk: in STD_LOGIC;
             sw0: in STD_LOGIC_VECTOR (3 downto 0);
             sw1: in STD_LOGIC_VECTOR (3 downto 0);
             sw2: in STD_LOGIC_VECTOR (3 downto 0);
             sw3: in STD_LOGIC_VECTOR (3 downto 0);
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

begin

design1 : assignment1
    port map(
        clk => clk, sw0=>cw0, sw1=>cw1, sw2=>cw2, sw3=>cw3,
        a1=>a1, b1=>b1, c1=>c1, d1=>d1, e1=> e1, f1=>f1, g1=>g1,dp=>dp,
        vec=>vec);

design2 : stopwatch
    port map(
        clk => clk, reset=>reset, start=> start, pause=> pause, continue=> continue, cw0=>cw0, cw1=>cw1, cw2=>cw2, cw3=>cw3);
end Behavioral;
