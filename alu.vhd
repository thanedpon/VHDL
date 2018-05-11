library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


entity alu is
port(  
        A,B : in std_logic_vector(7 downto 0);    --input operands
        Op : in std_logic_vector(1 downto 0);   --Operation to be performed 
        R : out std_logic_vector(7 downto 0)  --output of ALU

        );
end alu;

architecture Behavioral of alu is

--temporary signal declaration.
signal Reg3 : std_logic_vector(7 downto 0);

begin
process (Op)
	begin
		case Op is
			when "00" =>
				Reg3 <= A + B;    --addition
			when "01" =>
            Reg3 <= A - B;    --subtraction
			when "10" =>
            Reg3 <= A and B;  --AND gate
			when	"11" =>
            Reg3 <= A or B;   --OR gate
      end case; 

end process;
R <= Reg3;
		
end Behavioral;