library ieee;
use ieee.std_logic_1164.all;

entity Reg10 is
port
(
		ck, s, rs, ld	: in std_logic;
		d, p				: in std_logic_vector (9 downto 0);
		q					: out std_logic_vector(9 downto 0)
);
end Reg10;

architecture logica of reg10 is
component FFD is
port
(
		ck, d, s, rs, ld		: in std_logic; 
		q							: out std_logic
);
end component;
	
begin
		Flip_Flop0: FFD port map(ck, d(0), p(0), rs, ld, q(0));
		Flip_Flop1: FFD port map(ck, d(1), p(1), rs, ld, q(1));
		Flip_Flop2: FFD port map(ck, d(2), p(2), rs, ld, q(2));
		Flip_Flop3: FFD port map(ck, d(3), p(3), rs, ld, q(3));
		Flip_Flop4: FFD port map(ck, d(4), p(4), rs, ld, q(4));
		Flip_Flop5: FFD port map(ck, d(5), p(5), rs, ld, q(5));
		Flip_Flop6: FFD port map(ck, d(6), p(6), rs, ld, q(6));
		Flip_Flop7: FFD port map(ck, d(7), p(7), rs, ld, q(7));
		Flip_Flop8: FFD port map(ck, d(8), p(8), rs, ld, q(8));
		Flip_Flop9: FFD port map(ck, d(9), p(9), rs, ld, q(9));
end logica;
	