library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assignment1 is
--  Port ( );
     Port ( 
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
            
end assignment1;
   
architecture Behavioral of assignment1 is
     signal w,x,y,z : std_logic ;
     signal var : STD_LOGIC_VECTOR (3 downto 0);
     signal s1,s2: STD_LOGIC;
     signal counter : natural range 0 to 1200000:=0;
begin
process(var,x,y,z,w)
begin
    w <= not var(0) ;
    x <= not var(1) ;
    y <= not var(2) ;
    z <= not var(3) ;
    a1 <= not((x and z) or (var(1) AND var(2)) or (w and var(2)) or (var(0) and z) or (w and var(1) and var(3)) or (var(0) and x and y));
    b1 <= not((w and y and z) or (w and var(2) AND var(3)) or (var(0) AND y AND var(3)) OR (x and y) or (x and z)) ;
    c1 <= not((w and y) or (w and var(3)) or (y and var(3)) or (w and var(1)) or (var(0) and x));
    d1 <= not((w and x and z) or (x and var(2) and var(3)) or(var(1) and y and var(3)) or (var(1) AND var(2) AND z) or (var(0) AND y)) ;
    e1 <= not((x and z) or (var(2) and z) or (var(0) AND var(2)) or (var(0) AND var(1))) ;
    f1 <= not((w and var(1) and y) or (y and z) or (var(1) AND z) or (var(0) and x) or (var(0) AND var(2))) ;
    g1 <= not((w and var(1) and y) or (x and var(2)) or (var(2) and z) or (var(0) AND x) or (var(0) AND var(3))) ;

end process;
process(s1,s2, sw0,sw1,sw2,sw3)
begin
    if(s1='0' and s2='0') then
        vec<="0111";
        dp<='0';
        var <= sw0;
    elsif(s1='0' and s2='1') then
        vec <= "1011";
        dp<='1';
        var <= sw1;
    elsif(s1='1' and s2='1') then
        vec <= "1101";
        dp<='0';
        var <= sw2;
    elsif(s1='1' and s2='0') then
        vec <= "1110";
        dp<='1';
        var <= sw3;
    end if;    
end process;
process(clk)
begin
    if(rising_edge(clk)) then
    if(counter=1200000) then 
        counter<=0;
    end if;
    if(counter = 900000) then
        s1<='0';
        s2<='1';
    elsif(counter = 600000) then
        s1<='1';
        s2<='1'; 
    elsif(counter = 300000) then
        s1<='1';
        s2<='0';   
    elsif(counter = 0) then
        s1<='0';
        s2<='0';   
    end if;
    counter<=counter+1;
    end if;
end process;
         
end Behavioral;