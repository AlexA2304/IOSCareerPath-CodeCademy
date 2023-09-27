//
//  EditProfileForm.swift
//  Socialcademy
//
//  Created by Alex Archer on 8/21/23.
//

import SwiftUI

// MARK: - EditProfileForm

struct EditProfileForm: View {
    @StateObject var viewModel: FormViewModel<User>
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    ImageSection(imageURL: $viewModel.imageURL)
                }
                Button(action: viewModel.submit) {
                    if viewModel.isWorking {
                        ProgressView()
                    } else {
                        Text("Update Profile")
                    }
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .listRowBackground(Color.accentColor)
            }
            .onSubmit(viewModel.submit)
            .navigationTitle("Edit Profile")
        }
        .alert("Cannot Update Profile", error: $viewModel.error)
        .disabled(viewModel.isWorking)
        .onChange(of: viewModel.isWorking) { isWorking in
            guard !isWorking else { return }
            dismiss()
        }
    }
}

// MARK: - ImageSection

private extension EditProfileForm {
    struct ImageSection: View {
        @Binding var imageURL: URL?
        
        var body: some View {
            Section("Profile Image") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    EmptyView()
                }
                ImagePickerButton(imageURL: $imageURL) {
                    Label("Choose Image", systemImage: "photo.fill")
                }
            }
        }
    }
}

// MARK: - Preview

struct EditProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileForm(viewModel: FormViewModel<User>(initialValue: User.testUser, action: { _ in }))
    }
}
