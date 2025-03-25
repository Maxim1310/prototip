//
//  ContentView.swift
//  SUIRegForm
//
//  Created by Mac on 28.05.2024.
//

import SwiftUI

struct ContentView: View {
	
	@State private var username = ""
	@State private var password = ""
	@State private var passwordConfirm = ""
	
	var body: some View {
		VStack {
			Text("Создать аккаунт")
				.font(.system(.largeTitle, design: .rounded))
				.bold()
				.padding(.bottom, 30)
			
			FormField(fieldName: "Логин", fieldValue: $username)
			RequirementText(text: "минимум 4 символа")
				.padding()
			
			FormField(fieldName: "Пароль", fieldValue: $password, isSecure: true)
			VStack {
				RequirementText(iconName: "lock.open", text: "Минимум 8 символов", isStrikeThrough: false)
				RequirementText(iconName: "lock.open", text: "Один символ с большой буквы", isStrikeThrough: false)
			}
			.padding()
			
			FormField(fieldName: "Подтвердите пароль", fieldValue: $passwordConfirm, isSecure: true)
			RequirementText(text: "Пароль должен совпадать с введенным ранее", isStrikeThrough: false)
				.padding()
				.padding(.bottom, 50)
			
			Button(action: {
				// Нажатие на кнопку регистрации
			}) {
				Text("Зарегистрироваться")
					.font(.system(.body, design: .rounded))
					.foregroundColor(.white)
					.bold()
					.padding()
					.frame(minWidth: 0, maxWidth: .infinity)
					.background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
					.cornerRadius(10)
					.padding(.horizontal)
					
			}
			
			HStack {
				Text("Уже есть аккаунт?")
					.font(.system(.body, design: .rounded))
					.bold()
					
				Button(action: {
					// Нажатие на кнопку войти
				}) {
					Text("Войти")
						.font(.system(.body, design: .rounded))
						.bold()
						.foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
				}
			}.padding(.top, 50)
			
			Spacer()
		}
		.padding()
	}
	

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct FormField: View {
	var fieldName = ""
	@Binding var fieldValue: String
	
	var isSecure = false
	
	var body: some View {
		
		VStack {
			if isSecure {
				SecureField(fieldName, text: $fieldValue)
					.font(.system(size: 20, weight: .semibold, design: .rounded))
					.padding(.horizontal)
				
			} else {
				TextField(fieldName, text: $fieldValue)
					.font(.system(size: 20, weight: .semibold, design: .rounded))
					.padding(.horizontal)
			}

			Divider()
				.frame(height: 1)
				.background(Color(red: 240/255, green: 240/255, blue: 240/255))
				.padding(.horizontal)
			
		}
	}
}

struct RequirementText: View {
	
	var iconName = "xmark.square"
	var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
	
	var text = ""
	var isStrikeThrough = false
	
	var body: some View {
		HStack {
			Image(systemName: iconName)
				.foregroundColor(iconColor)
			Text(text)
				.font(.system(.body, design: .rounded))
				.foregroundColor(.secondary)
				.strikethrough(isStrikeThrough)
			Spacer()
		}
	}
}
