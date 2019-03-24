----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:33 10/24/2017 
-- Design Name: 
-- Module Name:    comparador - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparador is
    Port ( P : in  STD_LOGIC_VECTOR (5 downto 0);
           Q : in  STD_LOGIC_VECTOR (5 downto 0);
           PGTQ : out  STD_LOGIC;
           PLEQ : out  STD_LOGIC);
end comparador;

architecture Behavioral of comparador is
begin
process(P,Q)
begin
	if(P>Q) then
		PGTQ<='1';
		PLEQ<='0';
		else
		PGTQ<='0';
		PLEQ<='1';
		end if;
		
end process;

end Behavioral;

