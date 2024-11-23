
import PhotosUI
import SwiftUI

struct SelectImageView: View {
    @State var selectedPhoto: PhotosPickerItem?
    @State var image: Image?

    var body: some View {
        PhotosPicker(selection: $selectedPhoto, matching: .images) {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .top)
                    .clipShape(Circle())
            } else {
                ImagePlaceholderView()
            }
        }
        .onChange(of: selectedPhoto) { selectedPhoto in
            // Trailing closure passed to parameter of type 'any BackingData<Task>' that does not accept a closure
            Task {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    image = data
                }
            }
        }
    }
}

struct ImagePlaceholderView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .frame(width: 100, height: 100, alignment: .top)
                .opacity(0.6)
                .clipShape(Circle())

            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .mask(Capsule(style: .continuous))
        }
    }
}

#Preview("SelectImageView") {
    SelectImageView()
}
