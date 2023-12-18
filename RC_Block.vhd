library ieee;
use ieee.std_logic_1164.all;


entity RC_Block is
port
(
		Y, C			: in std_logic_vector (3 downto 0);
		ck, ld_r, clr_r, ld_c: in std_logic;
		
		outM			: out std_logic_vector (7 downto 0);
		Saida_RY		: out std_logic_vector(3 downto 0)
);
end RC_Block;


architecture logica of RC_Block is

component Mult is 
port
( 
		signal a			: in std_logic_vector(3 downto 0);
		signal b			: in std_logic_vector(3 downto 0);
		signal saida	: out std_logic_vector(7 downto 0)
);
end component;


component reg4 is 
port
(
		ck, s, rs, ld		: in std_logic;
		d, p					: in std_logic_vector (3 downto 0);
		q						: out std_logic_vector (3 downto 0)
);
end component;

		signal regY, regC, zr	: std_logic_vector (3 downto 0);

begin
		chRegY: reg4 port map (ck, clr_r, '0', ld_r, Y, zr, regY);
		chRegC: reg4 port map (ck, '0', '0', ld_c, C, zr, regC);
		
		chM: Mult port map (regY,regC, outM);
		
		Saida_RY <= regY;
	
	
end logica;
