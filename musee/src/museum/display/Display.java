package museum.display;

import java.util.List;

import museum.art.Art;
import museum.floorplan.Surface;

public class Display {
	private int id_display;
	private String name;
	public void setId_display(int id_display) {
		this.id_display = id_display;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDim_x(int dim_x) {
		this.dim_x = dim_x;
	}

	public void setDim_y(int dim_y) {
		this.dim_y = dim_y;
	}

	public void setDim_z(int dim_z) {
		this.dim_z = dim_z;
	}

	public void setSurface(Surface surface) {
		this.surface = surface;
	}

	public void setDisplay_model(DisplayModel display_model) {
		this.display_model = display_model;
	}

	public void setArts(List<Art> arts) {
		this.arts = arts;
	}

	private int dim_x;
	private int dim_y;
	private int dim_z;
	private Surface surface;
	private DisplayModel display_model;
	private List<Art> arts;
	
	/**
	 * constructor for Display when id_display is known
	 * @param id_display
	 * @param name
	 * @param dim_x
	 * @param dim_y
	 * @param dim_z
	 * @param surface
	 * @param display_model
	 * @param arts
	 */
	public Display(int id_display, String name, int dim_x, int dim_y, int dim_z, Surface surface,
			DisplayModel display_model, List<Art> arts) {
		this.id_display = id_display;
		this.name = name;
		this.dim_x = dim_x;
		this.dim_y = dim_y;
		this.dim_z = dim_z;
		this.surface = surface;
		this.display_model = display_model;
		this.arts = arts;
	}
	
	/**
	 * constructor for Display when id_display is unknown
	 * @param name
	 * @param dim_x
	 * @param dim_y
	 * @param dim_z
	 * @param surface
	 * @param display_model
	 * @param arts
	 */
	public Display(String name, int dim_x, int dim_y, int dim_z, Surface surface,
			DisplayModel display_model, List<Art> arts) {
		this.name = name;
		this.dim_x = dim_x;
		this.dim_y = dim_y;
		this.dim_z = dim_z;
		this.surface = surface;
		this.display_model = display_model;
		this.arts = arts;
	}

	public int getId_display() {
		return id_display;
	}
	
	public String getName() {
		return name;
	}

	public int getDim_x() {
		return dim_x;
	}

	public int getDim_y() {
		return dim_y;
	}

	public int getDim_z() {
		return dim_z;
	}

	public Surface getSurface() {
		return surface;
	}
	
	public DisplayModel getDisplay_model() {
		return display_model;
	}
	
	public List<Art> getArts() {
		return arts;
	}
	
	@Override
	public String toString() {
		return "Display [id=" + id_display + ", nom=" + name + ", dim_x=" + dim_x +
				", dim_y=" + dim_y + ", dim_z=" + dim_z +  ", zoneId=" + surface.getId_surface() +
				", displayTypeID=" + display_model.getId_display_model() + "]";
	}
}
