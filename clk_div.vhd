library ieee ;
use ieee.std_logic_1164 .all;


entity clk_div is
port
(		
		clk_in: in std_logic;
		clk_out: out std_logic
);
end clk_div;

architecture l of  clk_div is
signal ax	: std_logic;

begin

process (clk_in)
	variable cnt: integer range 0 to 13500000 := 0;
	begin
		if (rising_edge(clk_in)) then
			if (cnt = 13500000) then
				cnt := 0;
				ax <= not ax;
			else
				cnt := cnt+1;
			end if;
		end if;
	end process;
	
	clk_out <= ax;
	end l;