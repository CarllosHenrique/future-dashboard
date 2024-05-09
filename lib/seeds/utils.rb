module Seeds
  class Utils
    # def self.attach_images(target, path, method_name)
    #   extension = File.extname(path)
    #   remote_image_url = "#{ENV['REMOTE_IMAGE_BASE_URL']}#{path}"

    #   uri = URI.parse(remote_image_url)
    #   remote_image = uri.open

    #   target.send(method_name).attach(io: remote_image, filename: "image#{extension}")
    # end

    # def self.find_project(code_name)
    #   Project.find_by(code_name:)
    # end

    # def self.find_machine(name)
    #   Machine.find_by(name:)
    # end
  end
end
