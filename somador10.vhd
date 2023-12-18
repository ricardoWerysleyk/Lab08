library ieee;
use ieee.std_logic_1164.all;

entity somador10 is
port
( 
		A, B			: in std_logic_vector(9 downto 0);
		Saida			: out std_logic_vector(9 downto 0);
		CO				: out std_logic
);
end somador10;			
---------------------------------------------------------------------

architecture logica of somador10 is
----------------------------------------------------------------------
component COMP_ADD
port
(
	      A, B, CI: in std_logic;
         S, CO: out std_logic
);

end component;
----------------------------------------------------------------------

signal Carry_out: std_logic_vector(8 downto 0);

begin

    S0: COMP_ADD port map(A(0), B(0), '0', Saida(0), Carry_out(0));
    S1: COMP_ADD port map(A(1), B(1), Carry_out(0), Saida(1), Carry_out(1));
    S2: COMP_ADD port map(A(2), B(2), Carry_out(1), Saida(2), Carry_out(2));
    S3: COMP_ADD port map(A(3), B(3), Carry_out(2), Saida(3), Carry_out(3));
    S4: COMP_ADD port map(A(4), B(4), Carry_out(3), Saida(4), Carry_out(4));
    S5: COMP_ADD port map(A(5), B(5), Carry_out(4), Saida(5), Carry_out(5));
    S6: COMP_ADD port map(A(6), B(6), Carry_out(5), Saida(6), Carry_out(6));
	 S7: COMP_ADD port map(A(7), B(7), Carry_out(6), Saida(7), Carry_out(7));
	 S8: COMP_ADD port map(A(8), B(8), Carry_out(7), Saida(8), Carry_out(8));
    S9: COMP_ADD port map(A(9), B(9), Carry_out(8), Saida(9), CO);
	
end logica;