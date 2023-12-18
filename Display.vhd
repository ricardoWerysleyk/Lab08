library ieee;
use ieee.std_logic_1164.all;


entity Display is
port
(
		Entry_Display		: in std_logic_vector (3 downto 0);
		HDisp					: out std_logic_vector (6 downto 0)
);
end Display;

architecture logica of Display is
	signal A3, A2, A1, A0	: std_logic;
	
begin
	A3 <= Entry_Display(3);
	A2 <= Entry_Display(2);
	A1 <= Entry_Display(1);
	A0 <= Entry_Display(0);
	

	HDisp(0) <= (A1 or A3 or ((not A2) and (not A0)) or (A2 and A0));
	HDisp(1) <= ((not A2) or ((not A1) and (not A0)) or (A1 and A0));
	HDisp(2) <= ((not A1) or A0 or A2);
	HDisp(3) <= (((not A2) and (not A0)) or ((not A2) and A1) or (A1 and (not A0)) or (A2 and (not A1) and A0));
	HDisp(4) <= (((not A2) aND (not A0)) or (A1 and (not A0)));
	HDisp(5) <= (A3 or ((not A1) and (not A0)) or (A2 and (not A1)) or (A2 and (not A0)));
	HDisp(6) <= (A3 or ((not A2) and A1) or (A1 and (not A0)) or (A2 and (not A1)));
	
end logica;
