import { currentUser } from "@clerk/nextjs/server";
import {db} from "@/lib/db_connection";

// Checking user profile is present or not if not then creating a new user profile
// This function is used in the server side to check if the user is logged in or not
// If the user is logged in then it will return the user profile otherwise it will create a new user profile
// and return the new user profile
export const checkuser = async () =>{
    const user = await currentUser();

    //check if the user already profile created or not
    if (!user) {
        return null;
    }

    //checking if the user is logged in or not
    const loggedUser = await db.user.findUnique({
        where: {
            Clerkid: user.id,
        }
    })

    if(loggedUser)
        return loggedUser;

    const newUser = await db.user.create({
        data: {
            Clerkid: user.id,
            FName: `${user.firstName}`,
            LName: `${user.lastName}`,
            Email: user.emailAddresses[0]?.emailAddress,
            ImgURL: user.imageUrl,
        }
    });
    return newUser;

}