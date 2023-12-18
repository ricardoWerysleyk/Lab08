library ieee;
use ieee.std_logic_1164.all;

entity FFD is
port
(
	ck, d, s, rs, ld		: in std_logic;
	q							: out std_logic
);
end FFD;


architecture logica of FFD is
	signal sq: std_logic;
	
begin 
		process (ck, s, rs)
		begin
				if s = '1' then sq <= '1';
				elsif rs = '1' then sq <= '0';
				elsif ck'event and ck = '1' and ld = '1' then sq <= d;
				end if;
		end process;
		q <= sq;
end logica;

