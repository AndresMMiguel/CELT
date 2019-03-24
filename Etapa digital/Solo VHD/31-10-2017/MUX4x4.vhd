----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:55 10/24/2017 
-- Design Name: 
-- Module Name:    MUX4x4 - Behavioral 
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

entity MUX4x4 is
    Port ( E0 : in  STD_LOGIC_VECTOR (3 downto 0);
           E1 : in  STD_LOGIC_VECTOR (3 downto 0);
           E2 : in  STD_LOGIC_VECTOR (3 downto 0);
           E3 : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end MUX4x4;

architecture Behavioral of MUX4x4 is

begin

with S select Y<=
E0 when "00",
E1 when "01",
E2 when "10",
E3 when "11",
E3 when others;

end Behavioral;

