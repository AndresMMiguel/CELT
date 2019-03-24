----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:41:29 10/17/2017 
-- Design Name: 
-- Module Name:    visualizacion - Behavioral 
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

entity visualizacion is
    Port ( E0 : in  STD_LOGIC_VECTOR (3 downto 0);
           E1 : in  STD_LOGIC_VECTOR (3 downto 0);
           E2 : in  STD_LOGIC_VECTOR (3 downto 0);
           E3 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
           SEG7 : out  STD_LOGIC_VECTOR (6 downto 0);
           AN : out  STD_LOGIC_VECTOR (3 downto 0));
end visualizacion;

architecture Behavioral of visualizacion is

signal n_s: STD_LOGIC_VECTOR (1 downto 0);
signal n_y: STD_LOGIC_VECTOR (3 downto 0);

component MUX4x4
Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 0
E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 1
E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 2
E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 3
S : in STD_LOGIC_VECTOR (1 downto 0); -- Señal de control
Y : out STD_LOGIC_VECTOR (3 downto 0)); -- Salida
end component;

component decod7s
Port ( D : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada BCD
S: out STD_LOGIC_VECTOR (6 downto 0)); -- Salida para excitar los displays
end component;

component refresco
Port ( CLK : in STD_LOGIC; -- reloj
S : out STD_LOGIC_VECTOR (1 downto 0); -- Control para el mux
AN : out STD_LOGIC_VECTOR (3 downto 0)); -- Control displays individuales
end component;

begin

U1: MUX4x4 
port map(E0=>E0,
			E1=>E1, 
			E2=>E2, 
			E3=>E3, 
			S=>n_s, 
			Y=>n_y);

U2: decod7s
port map(D=>n_y, 
			S=>SEG7);

U3: refresco
port map(CLK=>CLK, 
			S=>n_s, 
			N=> AN);
 
end Behavioral;

