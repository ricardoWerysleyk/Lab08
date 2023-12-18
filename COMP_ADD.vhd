library ieee;
use ieee.std_logic_1164.all;

entity COMP_ADD is
    port(
	    A, B, CI: in std_logic;
       S, CO: out std_logic);
end COMP_ADD;

architecture logica of COMP_ADD is

begin

    S <= A xor B xor CI;
    CO <= (B and CI) or (A and CI) or (A and B);

end logica;
