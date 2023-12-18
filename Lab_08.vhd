library ieee;
use ieee.std_logic_1164.all;

entity Lab_08 is
port
(
		y, C					: in std_logic_vector( 3 downto 0);
		s_cod					: in std_logic_vector(1 downto 0);

		clk_sys, ld_r, clr_r, ld_c, en_cod		: 		in std_logic;
			
		UNIDADE				: out std_logic_vector (6 downto 0);
		DEZENA				: out std_logic_vector (6 downto 0);
		CENTENA				: out std_logic_vector (6 downto 0);
		MILHAR				: out std_logic_vector (6 downto 0)
		
);
end Lab_08;

architecture logica of Lab_08 is
---------------------------------------------------
component Filtro_FIR is
port
(
		y, C		: in std_logic_vector( 3 downto 0);
		clk_sys, ld_r, clr_r, ld_out, en_cod : in std_logic;
		s_cod		: in std_logic_vector( 1 downto 0);
		F			: out std_logic_vector( 9 downto 0)
);
end component; 
---------------------------------------------------
component binbcd is
port
(
	SW			: in std_logic_vector (9 downto 0);
	bcd		: out std_logic_vector (11 downto 0)
);
end component;
---------------------------------------------------
component Display is
port
(
		Entry_Display	: in std_logic_vector (3 downto 0);
		HDisp				: out std_logic_vector (6 downto 0)
);
end component;
---------------------------------------------------

signal Final_BCD: std_logic_vector (11 downto 0);
	

signal AUX1, AUX2, AUX3					: std_logic_vector (3 downto 0);
signal F_Fir						: std_logic_vector (9 downto 0);
signal UD7, DD7, CD7, MD7		: std_logic_vector (6 downto 0);

begin


	FILTRO1		: Filtro_FIR port map (y, c, clk_sys, ld_r, clr_r, ld_c, en_cod, s_cod, F_Fir);
	BCD			: binbcd port map (F_Fir, Final_BCD);

	UNI	: Display port map(Final_BCD(3 downto 0), UD7);
	UNIDADE <= (not UD7);
	
	DEZ	: Display port map(AUX2, DD7);
	DEZENA <= (not DD7);
	
	CEN	: Display port map(AUX3, CD7);
	CENTENA <= (not CD7);
			
	MILHAR <= ("1000000");
	
	AUX3(3) <= Final_BCD(11);
	AUX3(2) <= Final_BCD(10);
	AUX3(1) <= Final_BCD(9);
	AUX3(0) <= Final_BCD(8);
	
	AUX2(3) <= Final_BCD(7);
	AUX2(2) <= Final_BCD(6);
	AUX2(1) <= Final_BCD(5);
	AUX2(0) <= Final_BCD(4);

	
end logica;

