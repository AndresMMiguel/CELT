----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:40:28 10/24/2017 
-- Design Name: 
-- Module Name:    reg_desp - Behavioral 
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

entity reg_desp is
    Port ( SIN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (13 downto 0));
end reg_desp;

architecture Behavioral of reg_desp is

signal Qs : STD_LOGIC_VECTOR (13 downto 0):= (others=>'0');

begin
PROC_REG : process (CLK)
begin
	if (CLK'event and CLK='1' and EN='1') then
		Qs(0)<=Qs(1);
	Qs(1)<=Qs(2);
	Qs(2)<=Qs(3);
	Qs(3)<=Qs(4);
	Qs(4)<=Qs(5);
	Qs(5)<=Qs(6);
	Qs(6)<=Qs(7);
	Qs(7)<=Qs(8);
	Qs(8)<=Qs(9);
	Qs(9)<=Qs(10);
	Qs(10)<=Qs(11);
	Qs(11)<=Qs(12);
	Qs(12)<=Qs(13);
	Qs(13)<=SIN;
	end if;
	Q<=Qs;
	end process;
end Behavioral;
