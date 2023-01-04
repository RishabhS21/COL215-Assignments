LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY RAM IS
   PORT (
     a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
     d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
     clk : IN STD_LOGIC;
     re : IN STD_LOGIC;
     spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
   );
END RAM;

ARCHITECTURE Behavioral OF RAM IS
   COMPONENT dist_mem_gen_2
     PORT (
       a : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
       d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       clk : IN STD_LOGIC;
       re : IN STD_LOGIC;
       spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
     );
   END COMPONENT;

    

BEGIN
   
     uut : dist_mem_gen_2 port map (a=>a, d=>d,clk=>clk,re=>re,spo=>spo);

   
END Behavioral;