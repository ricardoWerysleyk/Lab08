library ieee;
use ieee.std_logic_1164.all;

entity Filtro_FIR is
port
(
		y, c			: in std_logic_vector( 3 downto 0);
		clk_sys, ld_r, clr_r, ld_out, en_cod: in std_logic;
		
		s_cod			: in std_logic_vector( 1 downto 0);
		
		F				: out std_logic_vector( 9 downto 0)
);
end Filtro_FIR;


architecture logica of Filtro_FIR is
---------------------------------------------------------------
component cod24 is
port
(
		s_cod: in std_logic_vector  (1 downto 0);
		en_cod: in std_logic;
		cd: out std_logic_vector (2 downto 0)
);
end component;
---------------------------------------------------------------
component RC_Block is
port
( 
		y, c: in std_logic_vector (3 downto 0);
		ck, ld_r,clr_r, ld_c: in std_logic;
		outM: out std_logic_vector (7 downto 0);
		Saida_RY: out std_logic_vector(3 downto 0)
);
end component;
---------------------------------------------------------------
component reg10 is
port
(
		ck, s, rs, ld: in std_logic;
		d, p: in std_logic_vector (9 downto 0);
		q: out std_logic_vector(9 downto 0)
);
end component;
---------------------------------------------------------------
component somador10 is
port
( 
		A, B			: in std_logic_vector(9 downto 0);
		Saida			: out std_logic_vector(9 downto 0);
		CO				: out std_logic
);
end component;
---------------------------------------------------------------
component clk_div is
port
(
		clk_in	: in std_logic;
		clk_out	: out std_logic
);
end component;
---------------------------------------------------------------
signal ci							: std_logic_vector  (2 downto 0);
signal Aux_BLC0, Aux_BLC1, Aux_BLC2			: std_logic;
signal Saida_RY1, Saida_RY2, Saida_RY3		: std_logic_vector  (3 downto 0);
signal outM1,outM2, outM3		: std_logic_vector  (7 downto 0);
signal outS1, outS2, aOutM1, aOutM2, aOutM3, DEM: std_logic_vector  (9 downto 0);
signal Cap1, Cap2, Clock			: std_logic;

begin
		Divisor_de_clock: clk_div port map(clk_sys, Clock);
		--Clock <= clk_sys;
		
		
		chCOD: cod24 port map (s_cod, en_cod, ci);
		
		Aux_BLC0 <= ci(0);
		Aux_BLC1 <= ci(1);
		Aux_BLC2 <= ci(2);
		
		RC_Block1: RC_Block port map (y, c, Clock, ld_r, clr_r, Aux_BLC0, outM1, Saida_RY1);
		RC_Block2: RC_Block port map (Saida_RY1, c, Clock, ld_r, clr_r, Aux_BLC1, outM2, Saida_RY2);
		RC_Block3: RC_Block port map (Saida_RY2, c, Clock, ld_r, clr_r, Aux_BLC2, outM3, Saida_RY3);
		
		aOutM1 <= ('0','0', outM1(7), outM1(6), outM1(5), outM1(4), outM1(3), outM1(2), outM1(1), outM1(0));
		aOutM2 <= ('0','0', outM2(7), outM2(6), outM2(5), outM2(4), outM2(3), outM2(2), outM2(1), outM2(0));
		aOutM3 <= ('0','0', outM3(7), outM3(6), outM3(5), outM3(4), outM3(3), outM3(2), outM3(1), outM3(0));
		
		SUM1A: somador10 port map (aOutM1, aOutM2, outS1, Cap1);
		SUM2B: somador10 port map (outS1, aOutM3, outS2, Cap2);
		
		count_Reg: reg10 port map (Clock, '0', '0', ld_out, outS2, DEM, f);
		
end logica;
