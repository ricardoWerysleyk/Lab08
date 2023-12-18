library ieee;
use ieee.std_logic_1164.all;

entity cod24 is
port
(
		s_cod		: in std_logic_vector (1 downto 0);
		en_cod	: in std_logic;
		cd			: out std_logic_vector (2 downto 0)
);
end cod24;

architecture logica of cod24 is

begin

	cd(0) <= ((not s_cod(0)) and (not s_cod(1)) and en_cod);
	cd(1) <= (s_cod(0) and (not s_cod(1)) and en_cod);
	cd(2) <= ((not s_cod(0)) and (s_cod(1)) and en_cod);
	
end logica;