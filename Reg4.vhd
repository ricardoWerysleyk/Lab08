library ieee;
use ieee.std_logic_1164.all;

entity Reg4 is
port
(
		ck, s, rs, ld	: in std_logic;
		d, p					: in std_logic_vector (3 downto 0);
		q						: out std_logic_vector (3 downto 0)
);
end Reg4;

architecture logica of Reg4 is
----------------------------------------------------
component FFD is
port
(
		ck, d, s, rs, ld: in std_logic; 
		q: out std_logic
);
end component;
----------------------------------------------------
signal Load : std_logic;


begin
		Load <= ld;
		
		ffd0: FFD port map(ck, d(0), p(0), rs, Load, q(0));
		ffd1: FFD port map(ck, d(1), p(1), rs, Load, q(1));
		ffd2: FFD port map(ck, d(2), p(2), rs, Load, q(2));
		ffd3: FFD port map(ck, d(3), p(3), rs, Load, q(3));
end logica;
