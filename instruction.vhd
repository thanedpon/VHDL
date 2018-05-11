library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity instruction is
	port(
			instruc_in : in std_logic_vector(1 downto 0); -- from pc
			
			alu_op : out std_logic_vector(1 downto 0); -- select alu
			rs  : out std_logic_vector(1 downto 0); -- select rs register
			rt  : out std_logic_vector(1 downto 0); -- select rt register
			rd  : out std_logic_vector(1 downto 0) -- select rd register
			);
end instruction;

architecture Behavioral of instruction is
--signal out_code : std_logic_vector(1 downto 0);
type instruction_set is array (0 to 3) of std_logic_vector(7 downto 0);
constant data_sel: instruction_set:=(
									"00000110", -- "00" Add $3 $1 $2
									"01100011", -- "01" sub $3 $1 $2
									"10000110", -- "10" and $3 $1 $2
									"11100011"  -- "11" or $3 $1 $2
									);

begin 
	alu_op <= data_sel(to_integer(unsigned(instruc_in)))(7 downto 6);
	rs     <= data_sel(to_integer(unsigned(instruc_in)))(5 downto 4);
	rt     <= data_sel(to_integer(unsigned(instruc_in)))(3 downto 2);
	rd     <= data_sel(to_integer(unsigned(instruc_in)))(1 downto 0);
			

end Behavioral;
