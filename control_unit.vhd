library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
	port(
			instruc_data : in std_logic_vector(1 downto 0);
			regwrite 	 : out std_logic;
			aluOpcode 		 : out std_logic_vector(1 downto 0)
			);
end control_unit;

architecture dataflow of control_unit is
begin
	with instruc_data select
				regwrite	<= '1' when "00",
								'1' when "01",
								'1' when "10",
								'1' when "11";
								

	with instruc_data select
				aluOpcode <= "00" when "00",
								 "01" when "01",
								 "10" when "10",
								 "11" when "11";
								
end dataflow;
								