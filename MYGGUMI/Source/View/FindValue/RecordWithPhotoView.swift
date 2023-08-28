//
//  RecordWithPhotoView\.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import PhotosUI
import SwiftUI

struct RecordWithPhotoView: View {
    @State private var imageLeft: Image?
    @State private var showingImagePickerLeft = false
    @State private var selectedImageLeft: UIImage?
    @State private var imageRight: Image?
    @State private var showingImagePickerRight = false
    @State private var selectedImageRight: UIImage?
    
    @State private var diaryText = ""
        
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                Spacer()
                VStack(spacing: 30) {
                    Text("10.25 Fri")
                        .description()
                        .padding(.bottom, 10)
                    HStack(spacing: 20) {
                        if let imageLeft = imageLeft {
                            imageLeft
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 106)
                                .cornerRadius(25)
                                .onTapGesture {
                                    showingImagePickerLeft = true
                                }
                        } else {
                            RectangleView(width: 120, height: 106, text: "")
                                .onTapGesture {
                                    showingImagePickerLeft = true
                                }
                        }
                        if let imageRight = imageRight {
                            imageRight
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 106)
                                .cornerRadius(25)
                                .onTapGesture {
                                    showingImagePickerRight = true
                                }
                        } else {
                            RectangleView(width: 120, height: 106, text: "")
                                .onTapGesture {
                                    showingImagePickerRight = true
                                }
                        }
                    }
                    ZStack {
                        VStack {
                            TextField("", text: $diaryText, axis: .vertical)
                                .placeholder(when: diaryText.isEmpty) {
                                    HStack {
                                        Spacer()
                                        Text("5단어로 오늘의 하루 표현하기\n(작성하지 않아도 됨)")
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                                .tint(.white)
                            Spacer()
                        }
                        .padding()
                        .frame(width: 345, height: 220)
                    }
                    .background(.white.opacity(0.3))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    HStack {
                        Spacer()
                        NavigationLink {
                            CalenderView()
                        } label: {
                            RectangleView(width: 100, height: 40, text: "작성완료")
                        }
                    }
                    .padding(.horizontal, 25)
                    
                }
                .multilineTextAlignment(.center)
                Spacer()
                CustomTabView()
            }
        }
        .sheet(isPresented: $showingImagePickerLeft, onDismiss: loadImageLeft) {
            ImagePicker(selectedImage: $selectedImageLeft)
        }
        .sheet(isPresented: $showingImagePickerRight, onDismiss: loadImageRight) {
            ImagePicker(selectedImage: $selectedImageRight)
        }
        .onAppear {
            if let _ = imageLeft {
                
            } else {
                showingImagePickerLeft = true
            }
        }
    }
    private func loadImageLeft() {
        guard let selectedImageLeft = selectedImageLeft else { return }
        imageLeft = Image(uiImage: selectedImageLeft)
        self.selectedImageLeft = nil // added to remove the UIImage from memory
    }
    private func loadImageRight() {
        guard let selectedImageRight = selectedImageRight else { return }
        imageRight = Image(uiImage: selectedImageRight)
        self.selectedImageRight = nil // added to remove the UIImage from memory
    }
}

struct RecordWithPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        RecordWithPhotoView()
    }
}
