library ieee;
use ieee.std_logic_1164.all;

entity binbcd is
port
(
		SW		: in std_logic_vector (9 downto 0);
		bcd	: out std_logic_vector (11 downto 0)
);
end binbcd;

architecture logica of binbcd is

component bloco is
port
(
		Entry	: in std_logic_vector (3 downto 0);
		Saida	: out std_logic_vector (3 downto 0)
);
end component;

-- sinais auxiliares para o subcircuitos

	signal C1A, C2A, C3A, C4A, C5A, C6A, C7A: std_logic_vector (3 downto 0);
	signal C1S, C2S, C3S, C4S, C5S, C6S, C7S: std_logic_vector (3 downto 0);

	begin
		-- subcircuito 01
		C1A(3) <= sw(8);
		C1A(2) <= sw(7);
		C1A(1) <= sw(6);
		C1A(0) <= sw(5);
		
		U1: bloCO port map(C1A,C1S);
		
		-- subcircuito 02
		C2A(3) <= C1S(2);
		C2A(2) <= C1S(1);
		C2A(1) <= C1S(0);
		C2A(0) <= sw(4);
		
		U2: bloCO port map(C2A,C2S);
		
		-- subcircuito 03
		C3A(3) <= C2S(2);
		C3A(2) <= C2S(1);
		C3A(1) <= C2S(0);
		C3A(0) <= sw(3);
		
		U3: bloCO port map(C3A,C3S);
		
		-- subcircuito 04
		C4A(3) <= sw(9);
		C4A(2) <= C1S(3);
		C4A(1) <= C2S(3);
		C4A(0) <= C3S(3);
		
		U4: bloCO port map(C4A,C4S);
		
		-- subcircuito 05
		C5A(3) <= C3S(2);
		C5A(2) <= C3S(1);
		C5A(1) <= C3S(0);
		C5A(0) <= sw(2);
		
		U5: bloCO port map(C5A,C5S);
		
		-- subcircuito 06
		C6A(3) <= C4S(2);
		C6A(2) <= C4S(1);
		C6A(1) <= C4S(0);
		C6A(0) <= C5S(3);
		
		U6: bloCO port map(C6A,C6S);
		
		-- subcircuito 07
		C7A(3) <= C5S(2);
		C7A(2) <= C5S(1);
		C7A(1) <= C5S(0);
		C7A(0) <= sw(1);
		
		U7: bloCO port map(C7A,C7S);
		
		bcd(11) <= '0';
		bcd(10) <= '0';
		bcd(9) <= C4S(3);
		bcd(8) <= C6S(3);
		bcd(7) <= C6S(2);
		bcd(6) <= C6S(1);
		bcd(5) <= C6S(0);
		bcd(4) <= C7S(3);
		bcd(3) <= C7S(2);
		bcd(2) <= C7S(1);
		bcd(1) <= C7S(0);
		bcd(0) <= SW(0);
end logica;