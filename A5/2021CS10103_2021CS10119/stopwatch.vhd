library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch is
port(
   clk: in std_logic;
   reset: in std_logic;
   start: in std_logic;
   pause: in std_logic;
   continue: in std_logic;
   cw0, cw1, cw2, cw3 : out STD_LOGIC_VECTOR (3 downto 0));

end stopwatch;

architecture Behavioral of stopwatch is

     signal counter1: natural range 0 to 10000000:=0;
     signal onetenth, seconds_1, seconds_2, minutes :integer:=0;
     signal enable_watch : std_logic :='0';
    --  signal if_start_used: std_logic :='0';
     signal clk2 : std_logic;
     signal vec : STD_LOGIC_VECTOR (3 downto 0);
--     signal sw1 : std_logic_vector (15 downto 0);

begin
    process(start,pause,continue,enable_watch)
    begin
 
 
      if (pause = '1') then
         if (continue = '1') then
             enable_watch <= '1';
         else
             enable_watch <= '0';
         end if;
         
      end if;
      if(start='1') then
         enable_watch <= '1';
      else
         enable_watch <= '0';
      end if;
    end process;
   
   process(clk, reset,enable_watch) is
--process(clk)
   begin
   if (reset='1') then
    onetenth <= 0;
    seconds_1 <= 0;
    seconds_2 <= 0;
    minutes <= 0;
    counter1 <= 0;
   end if;
--    if(enable_watch='1') then
           if (rising_edge(clk) and enable_watch='1' ) then
             if (counter1 = 10000000) then
                counter1 <= 0;
                 if onetenth = 9 then
                     onetenth <= 0;
                    if seconds_1 = 9 then
                         seconds_1 <= 0;
                         if seconds_2 = 5 then
                             seconds_2 <= 0;
                             if minutes = 9 then
                                 minutes <= 0;
                             else
                                 minutes <= minutes + 1;
                             end if;
                          else
                            seconds_2 <= seconds_2 + 1;
                         end if;
                    else
                       seconds_1 <= seconds_1 +1;
                    end if;
                 else
                    onetenth <= onetenth + 1;
                 end if;
              else
                counter1 <= counter1 + 1;   
              end if;
            end if;
--        end if;
--     end if;
   end process;

   process(onetenth)
   begin
       if(onetenth = 0) then
           cw3 <= "0000";
       elsif(onetenth = 1) then
           cw3 <= "1000";

       elsif(onetenth = 2) then
            cw3 <= "0100";
       elsif(onetenth = 3) then
            cw3 <= "1100";
       elsif(onetenth = 4) then
           cw3 <= "0010";
       elsif(onetenth = 5) then
           cw3 <= "1010";
       elsif(onetenth = 6) then
           cw3 <= "0110";
       elsif(onetenth = 7) then
           cw3 <= "1110";
       elsif(onetenth = 8) then
           cw3 <= "0001";
       elsif(onetenth = 9) then
           cw3 <= "1001";
       end if;
   end process;


   process(seconds_1)
   begin
       if(seconds_1 = 0) then
           cw2 <= "0000";
       elsif(seconds_1 = 1) then
           cw2 <= "1000";

       elsif(seconds_1 = 2) then
           cw2 <= "0100";
       elsif(seconds_1 = 3) then
            cw2 <= "1100";
       elsif(seconds_1 = 4) then
           cw2 <= "0010";
       elsif(seconds_1 = 5) then
           cw2 <= "1010";
       elsif(seconds_1 = 6) then
            cw2 <= "0110";
       elsif(seconds_1 = 7) then
           cw2 <= "1110";
       elsif(seconds_1 = 8) then
           cw2 <= "0001";
       elsif(seconds_1 = 9) then
           cw2 <= "1001";
       end if;
   end process;


   process(seconds_2)
   begin
       if(seconds_2 = 0) then
           cw1 <= "0000";
       elsif(seconds_2 = 1) then
           
           cw1 <= "1000";
       elsif(seconds_2 = 2) then
           cw1 <= "0100";
       elsif(seconds_2 = 3) then
            cw1 <= "1100";
       elsif(seconds_2 = 4) then
           cw1 <= "0010";
       elsif(seconds_2 = 5) then
           cw1 <= "1010";
       end if;
   end process;


   process(minutes)
   begin
       if(minutes = 0) then
           cw0 <= "0000";
       elsif(minutes = 1) then
           cw0 <= "1000";

       elsif(minutes = 2) then
           cw0 <= "0100";
       elsif(minutes = 3) then
           cw0 <= "1100";
       elsif(minutes = 4) then
           cw0 <= "0010";
       elsif(minutes = 5) then
           cw0 <= "1010";
       elsif(minutes = 6) then
           cw0 <= "0110";
       elsif(minutes = 7) then
           cw0 <= "1110";
       elsif(minutes = 8) then
           cw0 <= "0001";
       elsif(minutes = 9) then
           cw0 <= "1001";
       end if;
   end process;

end Behavioral;