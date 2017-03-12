Jekyll::Assets::Hook.register :env, :init do
  if defined? RailsAssets
    RailsAssets.load_paths.each do |path|
      append_path path
    end
  end
end
