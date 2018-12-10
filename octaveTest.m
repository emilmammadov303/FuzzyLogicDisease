N = 15;    # Increase number of vertices in each direction
iso = .4;  # Change isovalue to .1 to display a sphere
lin = linspace (0, 2, N);
[x, y, z] = meshgrid (lin, lin, lin);
v = abs ((x-.5).^2 + (y-.5).^2 + (z-.5).^2);
figure ();

subplot (2,2,1); view (-38, 20);
[f, vert] = isosurface (x, y, z, v, iso);
p = patch ("Faces", f, "Vertices", vert, "EdgeColor", "none");
pbaspect ([1 1 1]);
isonormals (x, y, z, v, p)
set (p, "FaceColor", "green", "FaceLighting", "gouraud");
light ("Position", [1 1 5]);

subplot (2,2,2); view (-38, 20);
p = patch ("Faces", f, "Vertices", vert, "EdgeColor", "blue");
pbaspect ([1 1 1]);
isonormals (x, y, z, v, p)
set (p, "FaceColor", "none", "EdgeLighting", "gouraud");
light ("Position", [1 1 5]);

subplot (2,2,3); view (-38, 20);
[f, vert, c] = isosurface (x, y, z, v, iso, y);
p = patch ("Faces", f, "Vertices", vert, "FaceVertexCData", c, ...
           "FaceColor", "interp", "EdgeColor", "none");
pbaspect ([1 1 1]);
isonormals (x, y, z, v, p)
set (p, "FaceLighting", "gouraud");
light ("Position", [1 1 5]);

subplot (2,2,4); view (-38, 20);
p = patch ("Faces", f, "Vertices", vert, "FaceVertexCData", c, ...
           "FaceColor", "interp", "EdgeColor", "blue");
pbaspect ([1 1 1]);
isonormals (x, y, z, v, p)
set (p, "FaceLighting", "gouraud");
light ("Position", [1 1 5]);