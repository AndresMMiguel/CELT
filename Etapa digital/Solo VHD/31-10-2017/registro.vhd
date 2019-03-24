----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:20 10/31/2017 
-- Design Name: 
-- Module Name:    registro - Behavioral 
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

entity registro is
    Port ( ENTRADA : in  STD_LOGIC_VECTOR (13 downto 0);
           SALIDA : out  STD_LOGIC_VECTOR (13 downto 0);
           EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end registro;

architecture Behavioral of registro is

begin
PROC_REG : process (CLK)
begin
	if (CLK'event and CLK='1' and EN='1') then 
		SALIDA<=ENTRADA;
		end if;
		end process;

end Behavioral;

