library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity register_file is
  port(
		clk : in std_logic;
		writeEnable : in std_logic;
		sel_wr :in std_logic_vector(1 downto 0); -- write data to destination register
		reg_rd :in std_logic_vector(7 downto 0);  -- destination register address
		
		sel_rs : in std_logic_vector(1 downto 0);  -- source register 1 address
		sel_rt : in std_logic_vector(1 downto 0);  -- source register 2 address
		
		out_rs : out std_logic_vector(7 downto 0); -- source register 1
		out_rt : out std_logic_vector(7 downto 0) -- source register 2
		
		);
			
end register_file;

architecture behavioral of register_file is
  type registerFile is array(0 to 3) of std_logic_vector(7 downto 0);
  signal reg : registerFile :=(
			"00000101",
			"00000111",
			"00001000",
			"00001010"
			);

begin
  process (clk) 
  begin
			
		if falling_edge(clk) then
			if (writeEnable = '1') then
				reg(to_integer(unsigned(sel_wr))) <= reg_rd;
			end if;
		end if;
  end process;
  
	out_rs <= reg(to_integer(unsigned(sel_rs))); 
	out_rt <= reg(to_integer(unsigned(sel_rt)));

end behavioral;
 