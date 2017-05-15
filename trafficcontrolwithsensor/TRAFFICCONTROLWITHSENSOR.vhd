library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TRAFFICCONTROLWITHSENSOR is
PORT(
		clk,reset: in std_logic;
		s_north,s_east,s_west,s_south : in std_logic;  --- sensors at north, east, west and south 
		e_red,e_yellow,e_green: out std_logic; --- East Lights
		w_red,w_yellow,w_green: out std_logic;--- West Lights
		n_red,n_yellow,n_green: out std_logic; --- North Lights
		s_red,s_yellow,s_green: out std_logic); --- South Lights
end TRAFFICCONTROLWITHSENSOR;

architecture Behavioral of TRAFFICCONTROLWITHSENSOR is
component COUNTER is 
PORT(
		clk : in std_logic;
		one_sec: out std_logic);
end component;
type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12);
signal state_signal : states;
signal cnt:integer range 0 to 5 :=0;
signal one_sec : std_logic;
begin
C1 : COUNTER PORT MAP (clk,one_sec);
process (reset,clk)
begin
if reset ='1' then
		cnt<=0;
		state_signal<=S0;

else if(rising_edge(clk)) then
case state_signal is
		when S0=>
						n_red<='0';n_yellow<='0';n_green<='1';
						e_red<='1';e_yellow<='0';e_green<='0';
						w_red<='1';w_yellow<='0';w_green<='0';
						s_red<='0';s_yellow<='0';s_green<='1';
						if s_north=0 and s_east=0 and s_west=0 and s_south=0 then
						cnt <= 0;
						state_signal <= S0;
						else 
						state_signal <= S1;
						end if;
		when S1=>
						
						n_red<='0';n_yellow<='0';n_green<='1';
						e_red<='1';e_yellow<='0';e_green<='0';
						w_red<='1';w_yellow<='0';w_green<='0';
						s_red<='0';s_yellow<='0';s_green<='1';
						if (cnt = 10) then
						cnt <= 0;
						state_signal <= S2;
						else 
						cnt <= cnt+1;
						state_signal <= S1;
						end if;
		when S2=>
						n_red<='0';n_yellow<='1';n_green<='0';
						e_red<='1';e_yellow<='0';e_green<='0';
						w_red<='1';w_yellow<='0';w_green<='0';
						s_red<='0';s_yellow<='1';s_green<='0';
						if (cnt = 1) then
						cnt <= 0;
						state_signal <= S3;
						else 
						cnt <= cnt+1;
						state_signal <= S2;
						end if;
		when S3=>
						n_red<='1';n_yellow<='0';n_green<='0';
						e_red<='1';e_yellow<='0';e_green<='0';
						w_red<='1';w_yellow<='0';w_green<='0';
						s_red<='1';s_yellow<='0';s_green<='0';
						if (cnt = 5) then
						cnt <= 0;
						state_signal <= S4;
						else 
						cnt <= cnt+1;
						state_signal <= S3;
						end if;
		when S4=>   
						n_red<='1';n_yellow<='0';n_green<='0';
						e_red<='0';e_yellow<='0';e_green<='1';
						w_red<='0';w_yellow<='0';w_green<='1';
						s_red<='1';s_yellow<='0';s_green<='0';
						if (cnt = 5) then
						cnt <= 0;
						state_signal <= S5;
						else 
						cnt <= cnt+1;
						state_signal <= S4;
						end if;
		when S5=>		
						n_red<='1';n_yellow<='0';n_green<='0';
						e_red<='0';e_yellow<='1';e_green<='0';
						w_red<='0';w_yellow<='1';w_green<='0';
						s_red<='1';s_yellow<='0';s_green<='0';
						if (cnt = 1) then
						cnt <= 0;
						state_signal <= S6;
						else 
						cnt <= cnt+1;
						state_signal <= S5;
						end if;
	    when S6=>		
						n_red<='1';n_yellow<='0';n_green<='0';
						e_red<='1';e_yellow<='0';e_green<='0';
						w_red<='1';w_yellow<='0';w_green<='0';
						s_red<='1';s_yellow<='0';s_green<='0';
						if (cnt = 1) then
						cnt <= 0;
						state_signal <= S0;
						else 
						cnt <= cnt+1;
						state_signal <= S6;
						end if;
			when others => 
								n_red<='0';n_yellow<='0';n_green<='0';
								e_red<='0';e_yellow<='0';e_green<='0';
								w_red<='0';w_yellow<='0';w_green<='0';
								s_red<='0';s_yellow<='0';s_green<='0';

----------------------- ReSERVED For Future USE________------
--		when S6=>
--		when S7=>
--		when S8=>
--		when S9=>
--		when S10=>
--		when S11=>
--		when S12=>
		
---------------------------------------------------------------		
		end case;
		end if;
		end if;
END PROCESS;

end Behavioral;

