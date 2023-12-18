library ieee;
use ieee.std_logic_1164.all;


entity bloco is
port(
		Entry		: in std_logic_vector (3 downto 0);
		Saida		: out std_logic_vector (3 downto 0)
			);
end bloco;

architecture logica of bloco is
	signal A3, A2, A1, A0	: std_logic;
	
begin
	A3 <= Entry(3);
	A2 <= Entry(2);
	A1 <= Entry(1);
	A0 <= Entry(0);

	Saida(3) <= A3 or (A2 and A0) or (A2 and A1);
	Saida(2) <= (A3 and A0) or (A2 and (not A1) and (not A0));
	Saida(1) <= ((not A2) and (A1)) or(A1 and A0) or (A3 and (not A0));
	Saida(0) <= (A3 and (not A0)) or ((not A3) and (not A2) and A0) or (A2 and A1 and (not A0));
end logica;