LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY COUNTER IS 
PORT(
		clk : in std_logic;
		one_sec: out std_logic);
end COUNTER;
ARCHITECTURE BEH OF COUNTER IS 
BEGIN
PROCESS (clk)
VARIABLE cnt : integer := 0;
BEGIN
	if rising_edge(clk) then
		cnt := cnt+1;
	if cnt = 50000000 then
		cnt:=0;
	end if;
	if cnt>=0 and cnt<=25000000 then
	one_sec<='1';
	else
	one_sec<='0';
	end if;
	end if;
end process;
end BEH;