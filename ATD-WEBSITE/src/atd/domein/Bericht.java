/*******************************************************************************
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *******************************************************************************/
package atd.domein;


public class Bericht {
	private int id;
	private String bericht;
	private User owner;
	private String date;
	
	public Bericht(int id, String bericht, String date, User owner){
		this.id = id;
		this.date = date;
		this.setBericht(bericht);
		this.setOwner(owner);
	}

	public String getBericht() {
		return bericht;
	}

	public void setBericht(String bericht) {
		this.bericht = bericht;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getDate() {
		return date;
	}
	
	public int getId(){
		return id;
	}
}
