----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:23 10/31/2017 
-- Design Name: 
-- Module Name:    automata - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity automata is
    Port ( CLK : in  STD_LOGIC;
           C0 : in  STD_LOGIC;
           C1 : in  STD_LOGIC;
           DATO : out  STD_LOGIC;
           CAPTUR : out  STD_LOGIC;
           VALID : out  STD_LOGIC);
end automata;

architecture Behavioral of automata is
type TIPO_ESTADO is (ESP_SYNC,AVAN_ZM,MUESTREO,DATO0,DATO1,DATOSYNC);
signal ST : TIPO_ESTADO:= ESP_SYNC ;
signal salidas : STD_LOGIC_VECTOR (2 downto 0) :="000";

begin
	process (CLK)
	variable cont : STD_LOGIC_VECTOR (7 downto 0):="00000000";
	
	begin
if (CLK'event and CLK = '1') then
	case ST is
		when ESP_SYNC =>
			if(C0='0' and C1='0') then
				ST<=AVAN_ZM;
				else ST<=ESP_SYNC;
				end if;
		when AVAN_ZM=>
			cont:=cont+1;
			if(cont=20) then
				cont:=(others=>'0');
				ST<=MUESTREO;
			else
				ST<=AVAN_ZM;
				end if;
		when MUESTREO=>
			cont:=cont+1;
			if(cont=39) then
				cont:=(others=>'0');
				if(C0='1' and C1='0') then
					ST<=DATO0;
				end if;
				if(C0='0' and C1='1') then
					ST<=DATO1;
				end if;
				if(C0='0' and C1='0') then
					ST<=DATOSYNC;
				end if;
			else
				ST<=MUESTREO;
				end if;
		when DATO0 =>
			ST<=MUESTREO;
		when DATO1 =>
			ST<=MUESTREO;
		when DATOSYNC =>
			ST<=MUESTREO;
		end case;
	end if;
end process;

with ST select 
	salidas<=
	"000" when ESP_SYNC,
	"000" when AVAN_ZM,
	"000" when MUESTREO,
	"010" when DATO0,
	"110" when DATO1,
	"001" when DATOSYNC,
	"000" when others;
	
DATO<=salidas(2);
CAPTUR<=salidas(1);
VALID<=salidas(0);

end Behavioral;

