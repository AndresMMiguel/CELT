----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:18 10/10/2017 
-- Design Name: 
-- Module Name:    reg_desp40 - Behavioral 
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

entity reg_desp40 is
    Port ( SIN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (39 downto 0));
end reg_desp40;

architecture Behavioral of reg_desp40 is
signal Qs : STD_LOGIC_VECTOR (39 downto 0):= (others=>'0');

begin
PROC_REG : process (CLK)
begin
if (CLK'event and CLK='1') then
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
	Qs(13)<=Qs(14);
	Qs(14)<=Qs(15);
	Qs(15)<=Qs(16);
	Qs(16)<=Qs(17);
	Qs(17)<=Qs(18);
	Qs(18)<=Qs(19);
	Qs(19)<=Qs(20);
	Qs(20)<=Qs(21);
	Qs(21)<=Qs(22);
	Qs(22)<=Qs(23);
	Qs(23)<=Qs(24);
	Qs(24)<=Qs(25);
	Qs(25)<=Qs(26);
	Qs(26)<=Qs(27);
	Qs(27)<=Qs(28);
	Qs(28)<=Qs(29);
	Qs(29)<=Qs(30);
	Qs(30)<=Qs(31);
	Qs(31)<=Qs(32);
	Qs(32)<=Qs(33);
	Qs(33)<=Qs(34);
	Qs(34)<=Qs(35);
	Qs(35)<=Qs(36);
	Qs(36)<=Qs(37);
	Qs(37)<=Qs(38);
	Qs(38)<=Qs(39);
	Qs(39)<= SIN;
end if;
end process;
Q<=Qs;
end Behavioral;

