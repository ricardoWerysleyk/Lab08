library ieee;
use ieee.std_logic_1164.all;

entity Mult is
port
( 
		signal A, B: in std_logic_vector(3 downto 0);

		signal saida: out std_logic_vector(7 downto 0)
);
			
end Mult;

architecture logica of Mult is
		signal V0	: std_logic_vector (7 downto 0);
		signal V1	: std_logic_vector (7 downto 0);
		signal V2	: std_logic_vector (7 downto 0);
		signal V3	: std_logic_vector (7 downto 0);

		signal a0, a1, a2, a3, b0, b1, b2, b3: std_logic_vector (7 downto 0);
		signal SUM0, SUM1, SUM2: std_logic_vector (7 downto 0);


component somador8 is
port
(
		a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		saida: out std_logic_vector(7 downto 0)
);
			
end component;

begin

	a0 <= ('0', '0', '0', '0', A(3), A(2), A(1), A(0));
	a1 <= ('0', '0', '0', A(3), A(2), A(1), A(0), '0');
	a2 <= ('0', '0', A(3), A(2), A(1), A(0), '0', '0');
	a3	<= ('0', A(3), A(2), A(1), A(0), '0', '0', '0');
	
	b0 <= ('0', '0', '0', '0', B(0), B(0), B(0), B(0));
	b1 <= ('0', '0', '0', B(1), B(1), B(1), B(1), '0');
	b2 <= ('0', '0', B(2), B(2), B(2), B(2), '0', '0');
	b3 <= ('0', B(3), B(3), B(3), B(3), '0', '0', '0');

	
	V0 <= a0 and b0;
	V1 <= a1 and b1;
	V2 <= a2 and b2;
	V3 <= a3 and b3;

	s0: somador8 port map (V0, V1, SUM0);
	s1: somador8 port map (SUM0, V2, SUM1);
	s2: somador8 port map (SUM1, V3, SUM2);

	saida <= SUM2;
	
end logica;