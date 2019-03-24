----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:53 10/24/2017 
-- Design Name: 
-- Module Name:    refresco - Behavioral 
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

entity refresco is
    Port ( CLK : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0);
           AN : out  STD_LOGIC_VECTOR (3 downto 0));
end refresco;

architecture Behavioral of refresco is

signal SS : STD_LOGIC_VECTOR (1 downto 0);
signal div : STD_LOGIC_VECTOR (31 downto 0);
signal CLK_v : STD_LOGIC;

begin
process (CLK)
	begin
		if(CLK'event and CLK='1') then
			div=div+1;
			
			if div = 5000000 then -- A 50 Hz
				CLK_v = not CLK_v;
				div<=(others=>'0');
			end if;
		end if;
		
end process;

process(CLK_v)
	begin
		if(CLK_v'event and CLK_v='1') then
			SS=SS+1;
		end if;
	end process;
	S<=SS;
	AN<= 	"0111" when SS="00" else
			"1011" when SS="01" else
			"1101" when SS="10" else
			"1110" when SS="11";
		
end Behavioral;

