library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
	port (
			clk : in std_logic;
			current : in std_logic_vector(1 downto 0);
			nextto_instruction : out std_logic_vector(1 downto 0)
			);
			
end pc;

architecture Behavior of pc is
signal selsignal_addr : std_logic_vector(1 downto 0);

begin
	process(clk)
		begin
			if (falling_edge(clk)) then
				selsignal_addr <= std_logic_vector(unsigned(current) + to_unsigned(1,2));
			end if;
	end process;
	nextto_instruction <= selsignal_addr;
end Behavior;

				