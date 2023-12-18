library ieee;
use ieee.std_logic_1164.all;

entity HALF_ADD is
    port(
	    A, B: in std_logic;
       S, CO: out std_logic);
end HALF_ADD;

architecture logica of HALF_ADD is

begin

    S <= A xor B;
    CO <= A and B;

end logica;