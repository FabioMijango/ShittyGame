extends TileMapLayer


@onready var path: TileMapLayer = $"../Path"

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
		if coords in path.get_used_cells_by_id(0):
			return true
		return false

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	if coords in path.get_used_cells_by_id(0):
		tile_data.set_navigation_polygon(0, null)