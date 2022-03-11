package com.codingdojo.peru.ft2022.bb.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.peru.ft2022.bb.models.LoginUser;
import com.codingdojo.peru.ft2022.bb.models.User;
import com.codingdojo.peru.ft2022.bb.repositories.UserRepository;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepo;

    // PARA HACER: ¡Escribir métodos de registro e inicio de sesión!

    // Este método será llamado desde el controlador
    // cada vez que un usuario envíe un formulario de registro.
    public User register(User newUser, BindingResult result) {
        // PARA HACER: ¡Validaciones adicionales!
        // PARA HACER: Rechazar valores o registrar si no hay errores:

        // ¿El correo electrónico ya está en uso?
        // Rechazar si el correo electrónico ya existe (presente en la base de datos)
        Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
        if (potentialUser.isPresent()) {
            result.rejectValue("email", "In Use", "Email already registered!");
        }

        // ¿La contraseña ingresada coincide con la contraseña de confirmación?
        // Rechazar si la contraseña no coincide con la confirmación
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        // Devuelve null si el resultado tiene errores
        if(result.hasErrors()) {
            // Salir del método y volver al controlador para manejar la respuesta
            return null;
        } else {
            // Contraseña hash y creación de un usuario si no hay errores
            // Cifra y establece la contraseña, guarda el usuario en la base de datos
            newUser.setPassword(BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()));
            return userRepo.save(newUser);
        }
    }
    public User login(LoginUser newLoginUser, BindingResult result) {
        // TO-DO: Additional validations!

        // ¿Existe un usuario con ese correo electrónico en la base de datos?
        Optional<User> potentialUser = userRepo.findByEmail(newLoginUser.getEmail());
        if (potentialUser.isEmpty()) {
            result.rejectValue("email", "Not found", "User doesn't exist!");
        } else {
            // Si es así, ¿es la contraseña correcta para ese correo electrónico?
            if(!BCrypt.checkpw(newLoginUser.getPassword(), potentialUser.get().getPassword())) {
                result.rejectValue("password", "Matches", "Invalid Password!");
            }
        }

        // Devuelve null si el resultado tiene errores
        if(result.hasErrors()) {
            // Salir del método y volver al controlador para manejar la respuesta
            return null;
        } else return potentialUser.get();
    }
}
